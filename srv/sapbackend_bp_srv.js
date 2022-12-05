const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
	const { BusinessPartners } = this.entities;
	const service = await cds.connect.to('API_BUSINESS_PARTNER');
	this.on('READ',  ['BusinessPartners' , 'Suppliers' ], request => {
		return service.tx(request).run(request.query);
	});
});