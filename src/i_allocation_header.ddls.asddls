@AbapCatalog.sqlViewName: 'IALLOCHEADER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for Allocation Header'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['AllocationId']
@ObjectModel.representativeKey: 'AllocationId'
@ObjectModel.writeActivePersistence: 'ZALLOCATION_HEADER'
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.draftEnabled: true
define view I_AllocationHeader
  as select from zallocation_header
{
  key allocation_id as AllocationId,
      invoice_number as InvoiceNumber,
      posting_date as PostingDate,
      created_by as CreatedBy,
      created_at as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Detail : I_AllocationDetail on $projection.AllocationId = _Detail.AllocationId,
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Item : I_AllocationItem on $projection.AllocationId = _Item.AllocationId
} 