class UnmakeCollectiveArgument{
  final int productId;

  UnmakeCollectiveArgument(this.productId);

  Map<String, dynamic> toMap(){
    return {
      'productId': productId,
    };
  }
}