@AbapCatalog.sqlViewName: 'IALLOCITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for Allocation Item'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['AllocationId', 'ItemNo', 'AllocationItemNo']
@ObjectModel.representativeKey: 'AllocationItemNo'
@ObjectModel.writeActivePersistence: 'ZALLOCATION_ITEM'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.draftEnabled: true
define view I_AllocationItem
  as select from zallocation_item
{
  key allocation_id as AllocationId,
  key item_no as ItemNo,
  key allocation_item_no as AllocationItemNo,
      material as Material,
      quantity as Quantity,
      unit as Unit,
      amount as Amount,
      currency as Currency,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
      _Header : I_AllocationHeader on $projection.AllocationId = _Header.AllocationId,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
      _Detail : I_AllocationDetail on $projection.AllocationId = _Detail.AllocationId
                                     and $projection.ItemNo = _Detail.ItemNo
} 