pageextension 50107 SalesLineExt extends "Sales Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Tax Amount"; Rec."Tax Amount")
            {
                ApplicationArea = All;

            }

        }
    }
}
