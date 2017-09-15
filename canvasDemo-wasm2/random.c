#include<stdio.h>
#include<stdlib.h>
#include<time.h> 
#include <emscripten.h>
char randomVector[2];
int EMSCRIPTEN_KEEPALIVE Random(int m, int n)
{
	
	int pos, dis;
	if (m == n)
	{
		return m;
	}
	else if (m > n)
	{
		pos = n;
		dis = m - n + 1;
		
		return rand() % dis + pos;
	}
	else
	{
		pos = m;
		dis = n - m + 1;
	
		return rand() % dis + pos;
	}
}
int EMSCRIPTEN_KEEPALIVE randomInTwoSection(int m, int n) {
	int r;
	int a = Random(m, n);
	if (a > 5) {
		r = Random(25, 30);
	}
	else {
		r = Random(-30, -25);
	}
	return r;
}

char* EMSCRIPTEN_KEEPALIVE randomGenerator(int x, int y, int r) {
	srand((unsigned)time(0));
	int randomX = randomInTwoSection(1, 10);
	int randomY = randomInTwoSection(1, 10);
	if (x - r <= 0) {
		randomX = Random(25, 30);
	
	}
	else if (x + r >= 800) {
		randomX = Random(-30, -25);
		
	}
	else if (y - r <= 0) {
		randomY = Random(25, 30);
	
	}
	else if (y + r >= 600) {
		randomY = Random(-30, -25);
	
	}
	
	randomVector[0] = randomX;
	randomVector[1] = randomY;

	
	return &randomVector[0];
}
