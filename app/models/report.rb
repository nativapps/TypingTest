class Report < ApplicationRecord
  belongs_to :participant

  ransacker :wpm do
    Arel.sql("to_char(\"#{table_name}\".\"wpm\", '99999999')")
  end

  ransacker :total_type do
    Arel.sql("to_char(\"#{table_name}\".\"total_type\", '99999999')")
  end

  ransacker :correct do
    Arel.sql("to_char(\"#{table_name}\".\"correct\", '99999999')")
  end

  ransacker :incorrect do
    Arel.sql("to_char(\"#{table_name}\".\"incorrect\", '99999999')")
  end

  ransacker :total_try do
    Arel.sql("to_char(\"#{table_name}\".\"total_try\", '99999999')")
  end
end
