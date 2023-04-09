function keep_where, where_expression, count, i0=i0, i1=i1, i2=i2
; Example
; -------
;   d = <array-3d>
;   index_1d = keep_where(d gt 10, count, i0=i0, i1=i1, i2=i2)
;   d_after_where = d[i0, i1, i2]
;
  index_1d = where(where_expression, count)
  dims = size(where_expression, /dim)

  i0 = index_1d mod dims[0]

  case n_elements(dims) of
    2: i1 = index_1d / dims[0]
    3: begin
        i1 = index_1d / dims[0] mod dims[1]
        i2 = index_1d / dims[0] / dims[1]
      end
    else:
  endcase

  return, index_1d
end
