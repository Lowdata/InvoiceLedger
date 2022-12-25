//SPDX-License-Identifier: ULICENSED

pragma solidity ^0.8.0;

contract InvoiceLedger{

    uint public c = 89;
    struct InvoiceStorage{
        uint invoiceId;
        uint BuyerPan;
        uint SellerPan;
        uint InvoiceAmount;
        uint InvoiceDate;
        bool PayStatus;
        
    }
    mapping(uint => InvoiceStorage ) invoices;
    uint public invoiceCount;
    

    function createInvoice(uint _buyerPan, uint _sellerPan, uint _invoiceAmount, uint _invoiceDate) public {
        invoices[invoiceCount] = InvoiceStorage(invoiceCount, _buyerPan, _sellerPan, _invoiceAmount, _invoiceDate, false);
        invoiceCount++;
    }
    function setInvoicePayStatus(uint _invoiceId) public{
        invoices[_invoiceId].PayStatus = true;
    }

    function getInvoiceById(uint _invoiceId) public view returns(uint, uint, uint, uint, uint, bool){
        return (invoices[_invoiceId].invoiceId, invoices[_invoiceId].BuyerPan, invoices[_invoiceId].SellerPan, invoices[_invoiceId].InvoiceAmount, invoices[_invoiceId].InvoiceDate, invoices[_invoiceId].PayStatus);
    }

    function getInvoiceByBuyerPan(uint _buyerPan) public view returns(uint[] memory){
        uint[] memory result = new uint[](invoiceCount);
        uint resultIndex = 0;
        for(uint i =0; i<invoiceCount; i++){
            if(invoices[i].BuyerPan == _buyerPan){
                result[resultIndex] = i;
                resultIndex++;
            }
        }return result;
    }


    }