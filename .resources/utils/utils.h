#ifndef UTILS_H_
#define UTILS_H_

#ifdef __cplusplus
extern "C" {
#endif
#include <cstdlib>
#include <chrono>
#include <thread>
#include <iostream>
#include <fstream>
#include <string>

void check(bool value);
void fail(void);
bool compare();

#ifdef __cplusplus
}
#endif

#endif