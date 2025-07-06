public with sharing class ExampleController {
  @AuraEnabled(cacheable=true)
  public static string getRecordName(Id recordId, String objectAPIName) {
    try {
      // Using WITH USER_MODE when building dynamic SOQL
      SObject record = Database.query(
        'SELECT Id, Name FROM ' +
          String.escapeSingleQuotes(objectAPIName) +
          ' WHERE Id = \'' +
          String.escapeSingleQuotes(recordId) +
          '\' WITH USER_MODE '
      );
      return (String) record.get('Name');
    } catch (Exception e) {
      System.debug(e);
    }
    return '';
  }
}
