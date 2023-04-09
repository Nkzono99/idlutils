pro extract_peak_from_tplot_data, tplot_data_name, vmin=vmin, vmax=vmax, datagap=datagap
    setDefaultValue, vmin, - !VALUES.D_INFINITY
    setDefaultValue, vmax, !VALUES.D_INFINITY
    setDefaultValue, datagap, 60

    get_data, tplot_data_name, data=d, dlim=dlim

    _ = keep_where(vmin lt d.v and d.v lt vmax, i1=i1)
    _ = max(d.y[*, i1], i, dim=2)
    v = d.v[*, i1]
    peak_values = v[i]
    peak_values[where(i eq 0)] = !VALUES.D_NAN

    data_peak = {x: d.x, y: peak_values}
    dlim = {ylog: dlim.ylog, ytitle: dlim.ytitle, yrange:dlim.yrange, ystyle: 1}

    store_data, tplot_data_name+'_peak', data=data_peak, dlim=dlim
    options, tplot_data_name+'_peak', datagap=60

    store_data, tplot_data_name+'_peak_overplot', data=[tplot_data_name, tplot_data_name+'_peak'], dlim=dlim
end
