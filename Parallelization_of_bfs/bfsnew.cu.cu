#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <cuda.h>
//#include <device_functions.h>
#include <cuda_runtime_api.h>

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define NUM_NODES 10

typedef struct
{
	int start;     // Index of first adjacent node in Ea	
	int length;    // Number of adjacent nodes 
} Node;

__global__ void CUDA_BFS_KERNEL(Node *Va, int *Ea, bool *Fa, bool *Xa, int *Ca,bool *done)
{

	int id = threadIdx.x + blockIdx.x * blockDim.x;
	if (id > NUM_NODES)
		*done = false;
		//printf("\n id is %d ", id);
		printf("\n Fa[id] is %d --> Xa[id] is %d", Fa[id], Xa[id]);

	if (Fa[id] == true && Xa[id] == false)
	{
		printf("\n id--> %d ", id); //This printf gives the order of vertices in BFS
		//printf("\n Fa[id] is %d", Fa[id]);
		Fa[id] = false;
		Xa[id] = true;
		__syncthreads(); 
		//int k = 0;
		//int i;
		int start = Va[id].start;
		//printf("\n Va[id] is %d", Va[id]);

		int end = start + Va[id].length;
		for (int i = start; i < end; i++) 
		{
			int nid = Ea[i];
			//printf("\n value of i is %d", i);
			//printf("\n nid is %d", nid); 
			if (Xa[nid] == false)
			{
				//printf("\n Va[id] is %d", Va[id]);
				Ca[nid] = Ca[id] + 1;
				Fa[nid] = true;
				*done = false;
			}

		}

	}

}

// The BFS frontier corresponds to all the nodes being processed at the current level.


int main()
{




	 Node node[NUM_NODES];
	
	
	//int edgesSize = 2 * NUM_NODES;
	int edges[NUM_NODES];

	for(int i = 0; i<10; i = i+5){
		node[i+0].start = i+0;
		node[i+0].length = 2;

		node[i+1].start = i+2;
		node[i+1].length = 1;

		node[i+2].start = i+3;
		node[i+2].length = 1;

		node[i+3].start = i+4;
		node[i+3].length = 1;

		node[i+4].start = i+5;
		if(i == 5)
		node[i+4].length = 0;
		else
		node[i+4].length = 1;

		edges[i+0] = i+1;
		edges[i+1] = i+2;	
		edges[i+2] = i+4;
		edges[i+3] = i+3;
		if(i == 5)
		edges[i+4] = i+4;
		else
		edges[i+4] = i+5;
	}
	//for(int i = 0; i< 10; i++){
	//	printf("\n node of %d is %d", i, node[i]);
	//	printf("\n edge of %d is %d", i, edges[i]);
	//}
	bool frontier[NUM_NODES] = { false };
	bool visited[NUM_NODES] = { false };
	int cost[NUM_NODES] = { 0 };

	int source = 0;
	frontier[source] = true;

	Node* Va;
	cudaMalloc((void**)&Va, sizeof(Node)*NUM_NODES);
	cudaMemcpy(Va, node, sizeof(Node)*NUM_NODES, cudaMemcpyHostToDevice);

	int* Ea;
	cudaMalloc((void**)&Ea, sizeof(Node)*NUM_NODES);
	cudaMemcpy(Ea, edges, sizeof(Node)*NUM_NODES, cudaMemcpyHostToDevice);

	bool* Fa;
	cudaMalloc((void**)&Fa, sizeof(bool)*NUM_NODES);
	cudaMemcpy(Fa, frontier, sizeof(bool)*NUM_NODES, cudaMemcpyHostToDevice);

	bool* Xa;
	cudaMalloc((void**)&Xa, sizeof(bool)*NUM_NODES);
	cudaMemcpy(Xa, visited, sizeof(bool)*NUM_NODES, cudaMemcpyHostToDevice);

	int* Ca;
	cudaMalloc((void**)&Ca, sizeof(int)*NUM_NODES);
	cudaMemcpy(Ca, cost, sizeof(int)*NUM_NODES, cudaMemcpyHostToDevice);

	

	int num_blks = 1;
	int threads = 10;



	bool done;
	bool* d_done;
	cudaMalloc((void**)&d_done, sizeof(bool));
	printf("\n\n");
	int count = 0;

	printf("Order: ");
	do {
		count++;
		done = true;
		cudaMemcpy(d_done, &done, sizeof(bool), cudaMemcpyHostToDevice);
		CUDA_BFS_KERNEL <<<num_blks, threads >>>(Va, Ea, Fa, Xa, Ca,d_done);
		cudaMemcpy(&done, d_done , sizeof(bool), cudaMemcpyDeviceToHost);

	} while (!done);




	cudaMemcpy(cost, Ca, sizeof(int)*NUM_NODES, cudaMemcpyDeviceToHost);
	
	printf("Number of times the kernel is called : %d \n", count);


	printf("\nCost: ");
	for (int i = 0; i<NUM_NODES; i++)
		printf( "%d    ", cost[i]);
	printf("\n");
	//_getch();
	
}