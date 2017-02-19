/**
 * File : checkboxHelper.js
 * Author : landen.li
 * Description : checkboxHelper
 * Create Date : 2011-01-13 16:38:59 
 */
Namespace.register("OfCard.chkHelper");

//indexof
Array.prototype.indexOf = function (value) {  
	var i;  
	for (i=0; i < this.length; i++) {  
		if (this[i] === value) {  
			return i;  
		}  
	}  
	return -1;  
};  
//contatins
Array.prototype.contains = function(obj){
	var i = this.length;
	while(i--){
		if(this[i] == obj)
			return true
	}
	return false;
}
//保留选择的array
var checkedArray = new Array();	
OfCard.chkHelper = function(){
	return{

		/**
		 * 获得选中的值
		 */
		getChecksVal : function(chkName,checked){
			checked = checked==null?true:false;
			var ched = checked==true?':checked':'';
			var vals='';
			$(":checkbox[name="+chkName+"]"+ched).each(
				function(){
					var chkval=$(this).val();
					if(vals=='')
						vals = chkval;
					else
						vals =vals + "," + chkval;
				}
			);
			return vals;
		},


		/**
		 * 设置全选
		 */
		setCheckAll : function(selectAllId,checksName){
			$('#'+selectAllId).click(function() {
				OfCard.chkHelper.checkAll($(this).context.checked,checksName);
			});
			this.clear(selectAllId);
		},

		/**
		 * 全选方法
		 */
		checkAll : function(checked,checksName){
			$(":checkbox[name="+checksName+"]").each(
				function(){
					$(this).context.checked = checked;
					if(!checkedArray.contains($(this).val())){
						if(checked){
							checkedArray.push($(this).val());
						}else{
							checkedArray.splice(checkedArray.indexOf($(this).val()),1);
						}
						$('#checkedCount').html(checkedArray.length);
					}
				}
			);
		},

		/**
		 * 设置自动全选
		 */
		setAutoCheckAll : function(selectAllId,checksName){
			this.setCheckAll(selectAllId, checksName);
			$(":checkbox[name="+checksName+"]").each(function(){
					$(this).click(function(){
						var checked = $(this).context.checked;
						var isAllChecked = true;
						$(":checkbox[name="+checksName+"]").each(function(){
							if($(this).context.checked != true)
								isAllChecked = false;
						});
						$.each($('#'+selectAllId),function(){
							$(this).context.checked = isAllChecked;
						});
						//$('#'+selectAllId).context.checked = true;//$('#'+selectAllId).attr('checked',true);
					})
					
				}	
			);

			
			if($(":checkbox[name="+checksName+"]").length>0){
				var isAllChecked = true;
				$(":checkbox[name="+checksName+"]").each(function(){
					if($(this).context.checked != true)
						isAllChecked = false;
				});
				
				$.each($('#'+selectAllId),function(){
					$(this).context.checked = isAllChecked;
				});
			}
		},


		/**
		 * 设置保留选中
		 */
		setCheckedArray : function(checksName){
			$(":checkbox[name="+checksName+"]").click(function() {
				var checked = $(this).context.checked;
				if(!checkedArray.contains($(this).val())){
					if(checked){
						checkedArray.push($(this).val());
					}else{
						checkedArray.splice(checkedArray.indexOf($(this).val()),1);
					}
					$('#checkedCount').html(checkedArray.length);
				}
			});
		},


		/**
		 * 获得保留选中的值
		 */
		getCheckedArray : function(joinStr){
			if(joinStr)
				return checkedArray.join(joinStr);
			else
				return checkedArray;
		},


		clear : function(IDorName,type,isClearValue){
			type = type==null?'id':'name';
			isClearValue = isClearValue==null?false:isClearValue
			if(type=='id'){
				$('#'+IDorName).attr('checked',false);
			}else{
				$("input[type=checkbox][name="+checksName+"]").each(
					function(){
						$(this).attr('checked',false);
						if(isClearValue)
							$(this).val('');
					}
				)
			}
		}
		
	}
}();
	