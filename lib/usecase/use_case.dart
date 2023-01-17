mixin UseCases<T, Params> {
  Future<T> call(Params params);
}

mixin NoParamUseCases<T> {
  Future<T> call();
}