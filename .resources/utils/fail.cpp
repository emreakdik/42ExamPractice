#include "utils.h"


using namespace std;

void fail(void) {
    cout << "FAIL" << endl;
    std::chrono::seconds duration(5);
    std::this_thread::sleep_for(duration);
    std::system("clear");
    std::system("cat sub.txt");
}