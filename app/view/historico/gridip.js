Ext.define('mypms.view.historico.gridip',{
    extend: 'Ext.grid.Panel',
    alias : 'widget.gridhistoricoip',
    store: 'historicoip',
    border: false,  
    columns: [{
    	header: "Tipo",
    	flex: 1,
    	dataIndex: 'tipo'
    },{
    	header: "Fisico",
    	flex: 1,
    	dataIndex: 'fisico'
    },{
    	header: "Nat",
    	flex: 1,
    	dataIndex: 'nat'
    },{
    	header: "Nivel",
    	flex: 1,
    	dataIndex: 'nivel'
    },{
    	header: "Sub-nivel",
    	flex: 1,
    	dataIndex: 'subnivel'
    }]
});
