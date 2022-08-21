public class SObjectRef implements Mappable {
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

    public SObjectRef(SObjectType objectType) {
        this.objectName = String.valueOf(objectType); 
        this.objectType = objectType;
    }

    public SObjectRef(SObjectField field) {
        this(SchemaUtils.getSObjectType(field));
    }

    public SObjectRef(SObject record) {
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

    // **** MAPPABLE **** // 
    public Boolean equals(Object obj) {
        // Any SObjectReferences with a like getSchemaType() should be considered equal
        SObjectRef otherRef = (obj instanceOf SObjectRef) ? (SObjectRef) obj : null;
        return otherRef?.toSchemaType() == this.toSchemaType();
    }

    public Integer hashCode() {
        return System.hashCode(this.objectType);
    }
}