#include "utils.h"

bool compare() {

    std::system("program1 > output1.txt");
    std::system("program2 > output2.txt");

    std::ifstream file1("output1.txt");
    std::ifstream file2("output2.txt");

    std::string line1, line2;
    while (std::getline(file1, line1) && std::getline(file2, line2)) {
        if (line1 != line2) {
            return 0;
        }
    }
    if (file1.eof() && file2.eof()) {
        return 1;
    }
    return 0;
}
