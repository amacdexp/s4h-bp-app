using {API_BUSINESS_PARTNER as sapbackend_bp} from './external/API_BUSINESS_PARTNER';

service bupaService {
    entity BusinessPartners as projection on sapbackend_bp.A_BusinessPartner;

    @cds.persistence.exists
    entity Suppliers as projection on sapbackend_bp.A_BusinessPartner {
        key BusinessPartner as ID,
        BusinessPartnerFullName as fullName,
        BusinessPartnerIsBlocked as isBlocked,
    }

}
