public with sharing class ContactQuery extends QueryObject {
  public ContactQuery() {
    super(new List<String>{ 'Id', 'Email' }, Contact.SObjectType);
  }

  public ContactQuery byEmails(Set<String> emails) {
    return (ContactQuery) byField('Contact.Email', 'IN', emails);
  }
}
