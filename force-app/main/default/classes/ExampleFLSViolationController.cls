public with sharing class ExampleFLSViolationController {
  @AuraEnabled(cacheable=true)
  public static string getRecordName(Id recordId, String objectAPIName) {
    try {
      // Using WITH USER_MODE when building dynamic SOQL
      String soql =
        'SELECT Id, Name FROM ' +
        objectAPIName +
        ' WHERE Id = \'' +
        recordId +
        '\' WITH USER_MODE ';
      SObject record = Database.query(soql);
      return (String) record.get('Name');
    } catch (Exception e) {
      System.debug(e);
    }
    return '';
  }
}
