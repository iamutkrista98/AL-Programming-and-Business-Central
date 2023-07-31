codeunit 50100 "Purchase Management"
{
    procedure PostPurchToPostedPurch(PurchCode: Code[20])
    var
        PurchaseHeader: Record PurchaseHeader;
        PurchLine: Record PurchaseLine;
        PostedPurchaseHeader: Record PostedPurchaseHeader;
        PostedPurchaseLine: Record PostedPurchaseLine;
        LocalAmtAfterTax: Decimal;
        totalAmount: Decimal;
        PurchAndRec: Record "Purchases & Payables Setup";
        Item: Record Item;
    begin
        if not CheckIfUserCanPost() then
            Error('Access Denied');
        PurchAndRec.Get();
        if PurchaseHeader.Get(PurchCode) then begin
            PurchaseHeader.TestField("Buy From Vendor");
            PostedPurchaseHeader.Init();
            PostedPurchaseHeader.TransferFields(PurchaseHeader);
            PostedPurchaseHeader.Insert(true);
            PostedPurchaseHeader."Received By" := PurchaseHeader."Received By";
            PostedPurchaseHeader.Modify();
            Clear(totalAmount);
            PurchLine.Reset();
            PurchLine.SetRange("Document No.", PurchaseHeader."No.");
            if PurchLine.FindSet() then
                repeat
                    PostedPurchaseLine.Init();
                    PostedPurchaseLine.TransferFields(PurchLine);
                    TaxCalculation(LocalAmtAfterTax, PurchLine."Line Total");
                    PostedPurchaseLine."Amount After Tax" := LocalAmtAfterTax;
                    PostedPurchaseLine.Insert();
                    InsertIntoPurchLedger(PurchLine, LocalAmtAfterTax);
                    totalAmount += PurchLine."Line Total";
                until PurchLine.Next() = 0;
            PurchLine.SetRange("Item No.", Item."No.");
            PostedPurchaseHeader."Total Amount" := totalAmount;
            PostedPurchaseHeader."Amount After Tax" := totalAmount + 0.13 * totalAmount;
            PostedPurchaseHeader.Modify();
            PurchLine.DeleteAll();
            PurchaseHeader.Delete(true);



        end;
    end;



    procedure TaxCalculation(var AmtAfterTax: Decimal; lineAmt: Decimal)
    var
        PurchAndPay: Record "Purchases & Payables Setup";
    begin
        PurchAndPay.Get();
        AmtAfterTax := 0.13 * lineAmt + lineAmt;
    end;


    local procedure InsertIntoPurchLedger(PurchLine: Record "PurchaseLine"; taxAmt: Decimal)
    var
        PurchLedger: Record "Purchase Ledger Entry";
        PurchHeader: Record PurchaseHeader;
        CusNo: Code[20];
    begin
        PurchLedger.Init();
        if PurchLedger.FindLast() then
            PurchLedger."Entry No." += 1
        else
            PurchLedger."Entry No." := 1;
        PurchLedger."Document No." := PurchLine."Document No.";
        PurchLedger."Item No." := PurchLine."Item No.";
        PurchLedger."Unit Price" := PurchLine."Unit Price";
        PurchLedger."Line Total" := taxAmt;
        PurchLedger.Quantity := PurchLine.Qty;
        PurchLedger."Customer No." := PurchHeader."Received By";
        PurchLedger.Insert();


    end;

    procedure CheckIfUserCanPost(): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        if UserSetup."Allow Posting" then
            exit(true)
        else
            exit(false);
    end;


    procedure PostBillToPostedBill(var BillNo: Code[20])
    var
        BillingHeader: Record "Billing Header";
        BillingLine: Record "Billing Line";
        PostedBillingHeader: Record PostedBillingHeader;
        PostedBillingLine: Record PostedBillingLine;
        PurchAndRec: Record "Purchases & Payables Setup";
        totalAmount: Decimal;
        localAmountAfterTax: Decimal;
        Item: Record Item;
        taxAmt: Decimal;


    begin
        PurchAndRec.Get();
        if BillingHeader.Get(BillNo) then begin
            BillingHeader.TestField("Sell to Customer");
            if BillingHeader.Type = BillingHeader.Type::" " then
                Error('Type is mandatory before posting');
            PostedBillingHeader.Init();
            PostedBillingHeader.TransferFields(BillingHeader);
            PostedBillingHeader.Type := BillingHeader.Type;
            PostedBillingHeader.Insert(true);
            PostedBillingHeader.Modify();
            Clear(totalAmount);
            BillingLine.Reset();
            BillingLine.SetRange("Document No", BillingHeader."No.");
            if BillingLine.FindSet() then
                repeat
                    PostedBillingLine.Init();
                    PostedBillingLine.TransferFields(BillingLine);
                    TaxCalculation(localAmountAfterTax, BillingLine."Line Total");
                    PostedBillingLine."Amount After Tax" := localAmountAfterTax;
                    PostedBillingLine.Insert();
                    InsertIntoBillingLedgerEntry(BillingLine, localAmountAfterTax);
                    totalAmount += BillingLine."Line Total";
                    taxAmt := totalAmount + 0.13 * totalAmount;
                until BillingLine.Next() = 0;
            BillingLine.SetRange("Item No", Item."No.");
            PostedBillingHeader."Total Amount" := totalAmount;
            PostedBillingHeader.Modify(true);
            BillingLine.DeleteAll(true);
            BillingHeader.Delete();

        end;


    end;


    local procedure InsertIntoBillingLedgerEntry(BillingLine: Record "Billing Line"; taxAmt: Decimal)
    var
        BillingLedgerEntry: Record "BillingLedgerEntry";
        BillingHeader: Record "Billing Header";
        CusName: Text[100];
    begin
        BillingLedgerEntry.Init();
        if BillingLedgerEntry.FindLast() then
            BillingLedgerEntry."Entry No." += 1
        else
            BillingLedgerEntry."Entry No." := 1;
        BillingLedgerEntry."Document No." := BillingLine."Document No";
        BillingLedgerEntry."Item No." := BillingLine."Item No";
        BillingLedgerEntry."Unit Price" := BillingLine."Unit Price";
        BillingLedgerEntry."Line Total" := taxAmt;
        BillingLedgerEntry.Quantity := BillingLine.Qty;
        getCustomerNoFromBillingHeader(BillingLine."Document No", CusName);
        BillingLedgerEntry."Customer Name" := CusName;
        BillingLedgerEntry.Insert();


    end;



    local procedure getCustomerNoFromBillingHeader(DocNo: Code[20]; var cusName: Text[100])
    var
        BillingHeader: Record "Billing Header";
    begin
        if BillingHeader.Get(DocNo) then
            cusName := BillingHeader."Customer Name";
    end;


}