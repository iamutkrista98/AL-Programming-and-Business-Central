tableextension 50105 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(50100; "Tax Amount"; Decimal)
        {
            Caption = '';
            DataClassification = ToBeClassified;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            var
                PurchPay: Record "Purchases & Payables Setup";
                Item: Record Item;
            begin
                if Type = Type::Item then begin
                    Item.Get("No.");
                    "Tax Amount" := Quantity * (Item."Unit Price" * (PurchPay."Bill Tax%" / 100)) + Item."Unit Price";

                end;
            end;
        }
    }
}
