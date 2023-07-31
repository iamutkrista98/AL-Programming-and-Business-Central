page 50115 BillingAPI
{
    APIGroup = 'custom';
    APIPublisher = 'utkrista';
    APIVersion = 'v1.0';
    Caption = 'billingAPI';
    DelayedInsert = true;
    EntityName = 'postedbillsheader';
    EntitySetName = 'postedbillheader';
    PageType = API;
    SourceTable = PostedBillingHeader;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field("type"; Rec."Type")
                {
                    Caption = 'Type';
                }
                field(sellToCustomer; Rec."Sell to Customer")
                {
                    Caption = 'Sell to Customer';
                }
                field(totalAmount; Rec."Total Amount")
                {
                    Caption = 'Total Amount';
                }
                field(customerName; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(userID; Rec."User ID")
                {
                    Caption = 'User ID';
                }
                field(billno; Rec.billno)
                {
                    Caption = 'billno';
                }
            }
        }
    }
}
