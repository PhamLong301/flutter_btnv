class FactorialModel {
  int calculateFactorial(int n) {
    return n <= 1 ? 1 : n * calculateFactorial(n - 1);
  }
}