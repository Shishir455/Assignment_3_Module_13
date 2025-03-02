
class Connections{
  static String baseurl = 'http://35.73.30.144:2008/api/v1';
  static String CreateProduct = '$baseurl/CreateProduct';
  static String ReadProduct = '$baseurl/ReadProduct';
  static String DeleteProduct(String id) => '$baseurl/DeleteProduct/$id';
  static String UpdateProduct( String id) => '$baseurl/UpdateProduct/$id';

}
