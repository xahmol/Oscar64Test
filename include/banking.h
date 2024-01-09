#ifndef BANKING_H
#define BANKING_H

__noinline void load_overlay(const char *fname);
void low_test();

#pragma compile("banking.c")

#endif