public with sharing class ApexLibraExample {
  private static List<Contact> getConsByEmail(Set<Stirng> emails) {
    return [
      SELECT Id, Email
      FROM Contact
      WHERE Email IN :emails
      WITH USER_MODE
    ];
  }

  private static List<Contact> getContactsByEmailsList(Set<String> emails) {
    return (List<Contact>) new ContactQuery.byEmails(emails).asUser().getList();
  }

  private static Map<String, Contact> getContactsByEmails(Set<String> emails) {
    // Get all contacts by email
    // Assume email is unique for this example
    Map<String, Contact> conMapByEmail = new Map<String, Contact>();
    List<Contact> cons = [
      SELECT Id, Email
      FROM Contact
      WHERE Email IN :emails
      WITH USER_MODE
    ];
    for (Contact c : cons) {
      conMapByEmail.put(c.Email, c);
    }
    return conMapByEmail;
  }

  private static Map<String, Contact> getContactsByEmailsList(
    Set<String> emails
  ) {
    return (Map<String, Contact>) new ContactQuery.byEmails(emails)
      .asUser()
      .getMapByField(Contact.Email);
  }
}
