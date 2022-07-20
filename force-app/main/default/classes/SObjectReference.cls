public class SObjectReference {
    // Wraps the SObjectType class, which is not JSON serializable
    String objectName;
    transient SObjectType objectType {
        get {
            if (this.objectType == null) {
                this.objectType = SchemaUtils.getSObjectType(this.objectName);
            }
            return this.objectType;
        }
        private set;
    }

    public SObjectReference(SObjectType objectType) {
        this.objectName = String.valueOf(objectType); 
        this.objectType = objectType;
    }

    public SObjectReference(SObjectField field) {
        this(SchemaUtils.getSObjectType(field));
    }

    public SObjectReference(SObject record) {
        this(record?.getSObjectType());
    }

    public Boolean isSObjectTypeOf(SObject record) {
        return record?.getSObjectType() == this.toSchemaType();
    }

    public SObjectType toSchemaType() {
        return this.objectType;
    }

    public override String toString() {
        return this.objectName; 
    }

    public Boolean equals(Object obj) {
        // Note: Necessary to allow this type to be safely used as a map key
        // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/langCon_apex_collections_maps_keys_userdefined.htm
        // Any SObjectReferences with a like getSchemaType() should be considered equal
        SObjectReference otherRef = (obj instanceOf SObjectReference) ? (SObjectReference) obj : null;
        return otherRef?.toSchemaType() == this.toSchemaType();
    }
}