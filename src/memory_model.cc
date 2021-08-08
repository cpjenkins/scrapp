#include <atomic>
#include <cstdio>
#include <cstdint>

struct pack {
   char a;        // memory location #1
   int  b : 5;    // memory location #2
   int  c : 11,
          : 0,
        d : 8;
   struct {
      int e : 8;
   } e_s;
};


int main() {
   fprintf(stderr, "pack: %zu\n", sizeof(pack));
}
