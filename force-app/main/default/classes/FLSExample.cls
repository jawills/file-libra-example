public with sharing class FLSExample {
  private static void updateContact(Contact c) {
    if (Schema.sObjectType.Contact.fields.Email.isUpdateable()) {
      update c;
    }
  }

  private static void updateContact(Contact c) {
    try {
      Database.update(c, AccessLevel.USER_MODE);
    } catch (DmlException e) {
      System.debug(e);
    }
  }

  private static List<Contact> getContactsByEmail(String email) {
    List<Contact> cons = [
      SELECT Id, Email
      FROM Contact
      WHERE Email = :email
      WITH USER_MODE
    ];
    return cons;
  }
}
