const Invoice = artifacts.require("./InvoiceLedger.sol");

contract("Invoice", () => {
    let invoice;

    beforeEach(async () => {
        invoice = await Invoice.new();
    });

    it("should create an invoice", async () => {
        const buyerPAN = web3.utils.utf8ToHex("1234567890");
        const sellerPAN = web3.utils.utf8ToHex("0987654321");
        const invoiceAmount = 100;
        const invoiceDate = Date.now();
        await invoice.createInvoice(buyerPAN, sellerPAN, invoiceAmount, invoiceDate);
        const invoiceCount = await invoice.invoiceCount();
        assert.equal(invoiceCount, 1);
    });

} )
