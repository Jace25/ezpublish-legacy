{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{default attribute_base=ContentObjectAttribute}
{let class_content=$attribute.contentclass_attribute.content}

{switch match=$class_content.selection_type}

{* Browse. *}
{case match=0}
<div class="block">

{section show=$attribute.content}
<table class="list" cellspacing="0">
<tr>
    <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Type'|i18n( 'design/standard/content/datatype' )}</th>
    <th>{'Section'|i18n( 'design/standard/content/datatype' )}</th>
</tr>
<tr>
    <td>{$attribute.content.class_identifier|class_icon( small, $attribute.content.class_name )}&nbsp;{$attribute.content.name|wash}</th>
    <td>{$attribute.content.class_name|wash}</th>
    <td>{fetch( section, object, hash( section_id, $attribute.content.section_id ) ).name|wash}</th>
</tr>
</table>
{section-else}
    <p>{'No relation'|i18n( 'design/standard/content/datatype' )}</p>
{/section}

{section show=$attribute.content}
    <input class="button" type="submit" name="RemoveObjectButton_{$attribute.id}" value="{'Remove object'|i18n( 'design/standard/content/datatype' )}" />
    <input class="button" type="submit" name="BrowseObjectButton_{$attribute.id}" value="{'Find object'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
    <input class="button-disabled" type="submit" name="RemoveObjectButton_{$attribute.id}" value="{'Remove object'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
    <input class="button" type="submit" name="BrowseObjectButton_{$attribute.id}" value="{'Find object'|i18n( 'design/standard/content/datatype' )}" />
{/section}

<input type="hidden" name="CustomActionButton[{$attribute.id}_set_object_relation]" value="{$attribute.id}" />
<input type="hidden" name="{$attribute_base}_data_object_relation_id_{$attribute.id}" value="{$attribute.data_int}" />

</div>
{/case}




{* Dropdown list. *}
{case match=1}
{let parent_node=fetch( content, node, hash( node_id, $class_content.default_selection_node ) )}

<select name="{$attribute_base}_data_object_relation_id_{$attribute.id}">
{section show=$attribute.contentclass_attribute.is_required|not}
<option value="" {section show=eq( $attribute.data_int, '' )}selected="selected"{/section}>{'No relation'|i18n( 'design/standard/content/datatype' )}</option>
{/section}

{section var=Nodes loop=fetch( content, list, hash( parent_node_id, $parent_node.node_id, sort_by, $parent_node.sort_array ) )}
<option value="{$Nodes.item.contentobject_id}" {section show=eq( $attribute.data_int, $Nodes.item.contentobject_id )}selected="selected"{/section}>{$Nodes.item.name|wash}</option>
{/section}
</select>

{section show=$class_content.fuzzy_match}
<input type="text" name="{$attribute_base}_data_object_relation_fuzzy_match_{$attribute.id}" value="" />
{/section}
{/let}
{/case}


{* Dropdown tree. Not implemented yet, thus unavailable from class edit mode. *}
{case match=2}
{/case}

{case/}

{/switch}

{/let}
{/default}
