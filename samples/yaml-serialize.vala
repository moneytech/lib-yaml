/*^* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  @software    :    pluie-yaml       <https://git.pluie.org/pluie/lib-yaml>
 *  @version     :    0.60
 *  @type        :    library
 *  @date        :    2018
 *  @license     :    GPLv3.0          <http://www.gnu.org/licenses/>
 *  @author      :    a-Sansara        <[dev]at[pluie]dot[org]>
 *  @copyright   :    pluie.org        <http://www.pluie.org>
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  This file is part of pluie-yaml.
 *
 *  pluie-yaml is free software (free as in speech) : you can redistribute it
 *  and/or modify it under the terms of the GNU General Public License as
 *  published by the Free Software Foundation, either version 3 of the License,
 *  or (at your option) any later version.
 *
 *  pluie-yaml is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 *  more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with pluie-yaml.  If not, see  <http://www.gnu.org/licenses/>.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *^*/

using GLib;
using Gee;
using Pluie;

public void test_object(Samples.YamlObject obj)
{
    of.action ("Test Object", obj.yaml_name);
    obj.type_object.method_a ();
    if (obj.type_gee_al != null) {
        of.keyval("yaml_name"    , "%s" .printf(obj.yaml_name));
        of.keyval("type_int"     , "%d" .printf(obj.type_int));
        of.keyval("type_bool"    , "%s" .printf(obj.type_bool.to_string ()));
        of.keyval("type_char"    , "%c" .printf(obj.type_char));
        of.keyval("type_string"  , "%s" .printf(obj.type_string));
        of.keyval("type_uchar"   , "%u" .printf(obj.type_uchar));
        of.keyval("type_uint"    , "%u" .printf(obj.type_uint));
        of.keyval("type_float"   , "%f" .printf(obj.type_float));
        of.keyval("type_double"  , "%f" .printf(obj.type_double));
        of.keyval("type_struct"  , "%s" .printf(obj.type_struct.to_string ()));
        of.keyval("type_enum"    , "%d (%s)" .printf(obj.type_enum, obj.type_enum.infos()));
        of.keyval("type_gee_al", "(%s<%s>)" .printf(obj.type_gee_al.get_type ().name (), obj.type_gee_al.element_type.name ()));
        foreach (var v in obj.type_gee_al) {
            of.echo("       - item : %g".printf (v));
        }
        of.keyval("type_object", "(%s)" .printf(obj.type_object.get_type ().name ()));
        of.keyval("    toto"     , "%s (string)" .printf(obj.type_object.toto));
        of.keyval("    tapa"     , "%s (string)" .printf(obj.type_object.tata));
        of.keyval("    titi"     , "%d (int)"    .printf(obj.type_object.titi));
        of.keyval("    tutu"     , "%s (bool)"   .printf(obj.type_object.tutu.to_string ()));
        obj.type_object.method_a ();

        of.keyval("type_gee_alobject", "(%s<%s>)" .printf(obj.type_gee_alobject.get_type ().name (), obj.type_gee_alobject.element_type.name ()));
        foreach (var child in obj.type_gee_alobject) {
            of.echo("        == entry (%s) ==".printf(child.get_type ().name ()));
            of.keyval("    toto"     , "%s (string)" .printf(child.toto));
            of.keyval("    tapa"     , "%s (string)" .printf(child.tata));
            of.keyval("    titi"     , "%d (int)"    .printf(child.titi));
            of.keyval("    tutu"     , "%s (bool)"   .printf(child.tutu.to_string ()));
            child.method_a ();
        }
        if (obj.type_gee_hmap != null) {
            of.keyval("type_gee_hmap", "(%s<%s, %s>)" .printf(obj.type_gee_hmap.get_type ().name (), obj.type_gee_hmap.key_type.name (), obj.type_gee_hmap.value_type.name ()));
            foreach (var child in obj.type_gee_hmap.entries) {
                of.echo("        == entry (%s) ==".printf(child.key));
                of.keyval("    toto"     , "%s (string)" .printf(child.value.toto));
                of.keyval("    tapa"     , "%s (string)" .printf(child.value.tata));
                of.keyval("    titi"     , "%d (int)"    .printf(child.value.titi));
                of.keyval("    tutu"     , "%s (bool)"   .printf(child.value.tutu.to_string ()));
            }
        }
        if (obj.type_gee_hmap2 != null) {
            of.keyval("type_gee_hmap", "(%s<%s, %s>)" .printf(obj.type_gee_hmap2.get_type ().name (), obj.type_gee_hmap2.key_type.name (), obj.type_gee_hmap2.value_type.name ()));
            foreach (var child in obj.type_gee_hmap2.entries) {
                of.echo("        == key ==");
                of.keyval("    obj :"    , "%s" .printf(child.key.to_string ()));
                of.echo("        == val (%s) ==".printf(child.value.get_type ( ).name ()));
                of.keyval("    toto"     , "%s (string)" .printf(child.value.toto));
                of.keyval("    tapa"     , "%s (string)" .printf(child.value.tata));
                of.keyval("    titi"     , "%d (int)"    .printf(child.value.titi));
                of.keyval("    tutu"     , "%s (bool)"   .printf(child.value.tutu.to_string ()));
            }
        }
        else {
            of.echo ("hmap2 null");
        }
    }
}

int main (string[] args)
{
    Echo.init(false);

    var path     = Yaml.DATA_PATH + "/tag.yml";
    var done     = false;

    of.title ("Pluie Yaml Library", Pluie.Yaml.VERSION, "a-sansara");
    Pluie.Yaml.DEBUG = false;
    var config = new Yaml.Config (path, true);
    var root   = config.root_node ();
    if ((done = root != null)) {
        root.display_childs ();

        of.action ("Yaml build first child", root.first ().name);
        var obj = (Samples.YamlObject) Yaml.Builder.from_node (root.first ());
        test_object (obj);

        of.action ("Serialize",  obj.yaml_name);
        uint8[] zdata = Yaml.serialize (obj);
        of.echo ("zdata size : %ld".printf (zdata.length));
        for (var i = 0; i < zdata.length; i++) {
            print ("%02x", zdata[i]);
        }
        of.action ("Deserialize zdata from", obj.yaml_name);
        root = Yaml.deserialize (zdata);
        root.display_childs ();
        of.action ("Yaml build first child", obj.yaml_name);
        obj  = (Samples.YamlObject) Yaml.Builder.from_node (root.first ());
        test_object (obj);

    }

    return (int) done;
}
