public class SoqlAggregation {
    Function function; 
    String fieldName;
    String alias;

    public SoqlAggregation(Function function, String fieldName, String alias) {
        this.function = function;
        this.fieldName = fieldName;
        this.alias = alias;
    }

    public SoqlAggregation(Function function, String fieldName) {
        this(function, fieldName, ''); 
    }

    public SoqlAggregation(Function function, SObjectField field, String alias) {
        this(function, String.valueOf(field), alias);
    }

    public SoqlAggregation(Function function, SObjectField field) {
        this(function, String.valueOf(field)); 
    }
    
    public override String toString() {
        return String.format('{0}({1}) {2}', new List<String>{
            String.valueOf(this.function), 
            this.fieldName, 
            this.alias
        }).trim();
    }
    
    // **** INNER **** // 
    public enum Function {
        AVG,
        COUNT,
        COUNT_DISTINCT,
        FORMAT,
        MIN,
        MAX,
        SUM
    }

    public class AggregateFilter extends Filter {
        public AggregateFilter(SoqlAggregation aggregation, Type operatorType, Object value) {
            super(aggregation?.toString(), operatorType, value); 
        }
    }
}