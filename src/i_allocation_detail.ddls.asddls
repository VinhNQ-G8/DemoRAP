@AbapCatalog.sqlViewName: 'IALLOCDETAIL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for Allocation Detail'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['AllocationId', 'ItemNo']
@ObjectModel.representativeKey: 'ItemNo'
@ObjectModel.writeActivePersistence: 'ZALLOCATION_DETAIL'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.draftEnabled: true
define view I_AllocationDetail
  as select from zallocation_detail
{
  key allocation_id as AllocationId,
  key item_no as ItemNo,
      amount as Amount,
      currency as Currency,
      tax_rate as TaxRate,
      note as Note,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT]
      _Header : I_AllocationHeader on $projection.AllocationId = _Header.AllocationId,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item : I_AllocationItem on $projection.AllocationId = _Item.AllocationId
                                     and $projection.ItemNo = _Item.ItemNo
} 