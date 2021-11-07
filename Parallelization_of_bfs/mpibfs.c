#include<mpi.h>
#include<stdio.h>
#include<stdlib.h>
//#include<iostream>
//using namespace std;

#define MAX_QUEUE_SIZE 20

int areAllVisited(int visited[], int size)
{
	for(int i = 0; i < size; i++)
	{
		if(visited[i] == 0)
			return 0;
	}
	return 1;
}

int main(int argc, char *argv[])
{
	//Variables and Initializations
	int size, rank;
	int adjacency_matrix[400];
	int adjacency_queue[MAX_QUEUE_SIZE];
	int source_vertex;
	int no_of_vertices;
	int adjacency_row[20];
	int bfs_traversal[400];
	int visited[100];
	int index = 0,i=0,j=0,k=0;
	int f[100],l=0;
	//MPI Code
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
		
	if(rank == 0)
	{
		//Entering the Number of vertices
		fprintf(stdout,"Enter the number of vertices\n");
		fflush(stdout);
		fscanf(stdin,"%d",&no_of_vertices);

		//Entering the Adjacency Matrix
		fprintf(stdout,"Enter the Adjacency Matrix\n");
		fflush(stdout);
		for( i = 0; i < no_of_vertices * no_of_vertices; i++)
		{
			fscanf(stdin,"%d",&adjacency_matrix[i]);
		}
		fprintf(stdout,"\n");

		//Entering the Source Vertex
		fprintf(stdout,"Enter the Source Vertex\n");
		fflush(stdout);
		fscanf(stdin,"%d",&source_vertex);
		fprintf(stdout,"\n");
	}
	int* f1=(int*)malloc(sizeof(int)*no_of_vertices);
	//Broadcasting the Number of vertices and the source vertex;
	MPI_Bcast(&no_of_vertices, 1, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Bcast(&source_vertex, 1, MPI_INT, 0, MPI_COMM_WORLD);

	//Scattering each row of the adjacency matrix to each of the processes
	MPI_Scatter(adjacency_matrix, no_of_vertices, MPI_INT, adjacency_row, no_of_vertices, MPI_INT, 0, MPI_COMM_WORLD);

	//Initializing The Adjacency Queue of each process
	if(rank>=0)
	for(i = 0; i < MAX_QUEUE_SIZE; i++)
	{
		adjacency_queue[i] = -1;
		//fprintf(stdout,"x");
	}

	//BFS code
	
	//if(rank >= source_vertex)
	//{
		for(i = 0; i < no_of_vertices; i++)
		{
			if(adjacency_row[i] == 1)
			{
				adjacency_queue[index++] = i;
			}
		}
	//}

	//Each Process printing the adjacent nodes found
	if (rank>=0)
	{
	fprintf(stdout,"Process %d:",rank);
	fflush(stdout);
	for(i = 0; i < index; i++)
	{
		fprintf(stdout,"  %d   ",adjacency_queue[i]);		
		fflush(stdout);

	}
	fprintf(stdout,"\n");
	}
	//For synchronization
	MPI_Barrier(MPI_COMM_WORLD);

	//Gathering all the nodes in BFS found by each process
	MPI_Gather(adjacency_queue, MAX_QUEUE_SIZE, MPI_INT, bfs_traversal, MAX_QUEUE_SIZE, MPI_INT, 0, MPI_COMM_WORLD);

	//Printing the Order of traversed nodes in root
	for(i = 0; i < no_of_vertices; i++)
	{
		visited[i] = 0;
	}

	if(rank == 0)
	{
		int a=source_vertex,h=0;
		int b,p[no_of_vertices];
		for(i=0;i<no_of_vertices;i++)
		p[i]=0;
		fprintf(stdout,"\nBFS Traversal: \n ");
		fflush(stdout);
		visited[source_vertex] = 1;
		fprintf(stdout," %d \n %d",source_vertex,source_vertex);
		fflush(stdout);
		//f[l]=a;
		//l=l+1;
		*f1=a;
		f1++;
		b=a;
		

	for(int i = 0; i < MAX_QUEUE_SIZE * no_of_vertices; i++)
		{
			//Exit Condition
			if(areAllVisited(visited, no_of_vertices))
			{
				break;
			}

			if(bfs_traversal[i] != -1)
			{
				if(visited[bfs_traversal[i]] == 0)
				{
					fprintf(stdout," -> %d",bfs_traversal[i]);
					visited[bfs_traversal[i]] = 1;
				}
			}
			else
			{
				continue;
			}
		}
}
	//End of BFS code
	MPI_Finalize();
	return 0;
}



