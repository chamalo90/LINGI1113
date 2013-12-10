#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

/** Usefull structures */

struct node {
	struct node *next;
	int val;
};

struct queue {
	struct node *head;
	struct node *tail;
};

struct thread_arg {
	FILE *f;
};

/** Global variables */

struct queue queue_head;

#define BUFF_SIZE 10

sem_t full;
sem_t empty;
pthread_mutex_t lock;

pthread_t threads[2];

/** Thread, producing random numbers and putting them into the buffer */
static void *thread_produce(void *arg)
{
	while (1) {
		int val = rand();
		struct node *n = (struct node *)malloc(sizeof(*n));

		n->val = val;
		n->next = NULL;

		/* Enter critical region */
		sem_wait(&full);
		pthread_mutex_lock(&lock);

		/* head not set yet? Thus it's the first */
		if (!queue_head.head)
			queue_head.head = n;

		/* tail is set? Let point the last one to the new one */
		if (queue_head.tail)
			queue_head.tail->next = n;

		queue_head.tail = n;

		pthread_mutex_unlock(&lock);
		sem_post(&empty);
	}

	return NULL;
}

/**
 *  Slow (look at the call to sleep()) consumer-thread, reading values from the
 *  buffer and writing them to the file.
 */
static void *thread_consume(void *arg)
{
	struct thread_arg *a = arg;
	while (1) {
		int val;
		struct node *n;

		/* Enter critical region */
		sem_wait(&empty);
		pthread_mutex_lock(&lock);

		n = queue_head.head;
		queue_head.head = n->next;

		/* Was it the last one? fix the tail-pointer */
		if (!n->next)
			queue_head.tail = NULL;

		pthread_mutex_unlock(&lock);
		sem_post(&full);

		val = n->val;
		free(n);

		fprintf(a->f, "%d\n", val);
		fflush(a->f);

		sleep(1);
	}

	return NULL;
}

int main (int argc, char const *argv[])
{
	int i, ret;
	struct thread_arg arg;

	arg.f = fopen("my_file.txt", "w");
	if (!arg.f)
		goto err_open;

	ret = sem_init(&empty, 0, 0);
	if (ret)
		goto err_empty;

	ret = sem_init(&full, 0, BUFF_SIZE);
	if (ret)
		goto err_full;
	
	ret = pthread_mutex_init(&lock, NULL);
	if (ret)
		goto err_mutex;

	ret = pthread_create(&threads[0], NULL, thread_produce, NULL);
	if (ret)
		goto err_mutex;

	ret = pthread_create(&threads[1], NULL, thread_consume, &arg);
	if (ret)
		goto err_mutex;

	for (i = 0; i < 2; ++i) {
		ret = pthread_join(threads[i], NULL);
		if (ret)
			goto err_mutex;
	}

 	ret = sem_close(&full);
	if (ret)
		goto err_full;

 	ret = sem_close(&empty);
	if (ret)
		goto err_empty;

	return 0;

err_mutex:
	sem_close(&full);
err_full:
	sem_close(&empty);
err_empty:
	fclose(arg.f);
err_open:
	perror("Error happened!\n");
	return 1;
} 
