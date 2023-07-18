pageextension 50140 searchFunctions extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action("Get Function")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Cust.Get('10000') then
                        Message(Text001)
                    else
                        Message(Text002);

                end;
            }

            action("Find Function")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                //+ last record in the table
                //- first record in the table

                trigger OnAction()
                begin
                    Cust."No." := '10000';
                    if Cust.Find('=') then
                        Message(Text003, Cust."No.", Cust.Name, Cust.Address)
                    else
                        Message(Text002);


                end;


            }
            //Next function
            //>0 - forward search 
            //<0 - backward search
            //=0 -stay on same record

            action("Next Function")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    count := 0;
                    if Cust.Find('-') then
                        repeat
                            count += 1;
                        until Cust.Next() = 0;
                    Message('Count is: %1', count);
                end;


            }


        }
    }

    var
        Cust: Record Customer;
        Text001: Label 'Record Found';
        Text002: Label 'Record Not Found';
        Text003: Label 'Record Found: Customer Number: % \Customer Name: %2,\Customer Address: %3';
        count: Integer;



}