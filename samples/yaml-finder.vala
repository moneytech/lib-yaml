/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  @software  : lib-yaml    <https://git.pluie.org/pluie/lib-yaml>
 *  @version   : 0.3
 *  @date      : 2018
 *  @licence   : GPLv3.0     <http://www.gnu.org/licenses/>
 *  @author    : a-Sansara   <[dev]at[pluie]dot[org]>
 *  @copyright : pluie.org   <http://www.pluie.org/>
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  This file is part of lib-yaml.
 *  
 *  lib-yaml is free software (free as in speech) : you can redistribute it
 *  and/or modify it under the terms of the GNU General Public License as
 *  published by the Free Software Foundation, either version 3 of the License,
 *  or (at your option) any later version.
 *  
 *  lib-yaml is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 *  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 *  more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with lib-yaml.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

using GLib;
using Gee;
using Pluie;

int main (string[] args)
{
    Echo.init(false);

    var path     = "resources/test.yml";
    var done     = false;

    of.title ("Pluie Yaml Library", Pluie.Yaml.VERSION, "a-sansara");
//~     Pluie.Yaml.Scanner.DEBUG = false;
    var loader = new Yaml.Loader (path, true);
    if ((done = loader.done)) {
        Yaml.NodeRoot root = loader.get_nodes ();
        var finder = new Yaml.Finder(root);
        Yaml.Node? node = null;

        var spath = "[product]{0}[description]";
        // equivalent in DOT MODE
        // spath = "product{0}.description";
        of.action ("Find node", spath);
        if ((node = finder.find(spath)) != null) {
            of.echo (node.to_string (false));
        }
        of.state (node != null);
        
        spath = "[product]{0}[description]{0}";
        // equivalent in DOT MODE
        // spath = "product{0}.description[0}";
        of.action ("Find scalar node", spath);
        if ((node = finder.find(spath)) != null) {
            of.echo (node.to_string (false));
        }
        of.state (node != null);

        spath = "[product]{1}";
        of.action ("Find node", spath);
        if ((node = finder.find(spath)) != null) {
            of.echo (node.to_string (false));
            of.state (node != null);
            
            spath = "[description]{0}";
            of.action ("Find subnode in node context", spath);
            of.keyval ("context", node.name);
            if ((node = finder.find(spath, node)) != null) {
                of.echo (node.to_string (false));
            }
            of.state (node != null);
        }
        else of.state (node != null);

        of.action ("Set find mode", "DOT");
        Yaml.BaseNode.mode = Yaml.FIND_MODE.DOT;
        of.state (true);

        spath = "bill-to.family";
        of.action ("Find node", spath);
        if ((node = finder.find(spath)) != null) {
            of.echo (node.to_string (false));
            of.action ("get scalar value", spath);
            of.echo ((node as Yaml.NodeSinglePair).scalar ().data);

            of.action ("get parent node");
            of.echo (node.parent.to_string ());
            
            of.action ("get address node");
            if ((node = (node.parent as Yaml.NodeMap).map["address"])!= null) {
                of.echo (node.to_string (false));
                (node as Yaml.NodeMap).display_childs ();
                
                of.action ("Loop throught childs", node.name);
                foreach (var child in (node as Yaml.NodeMap).map.values) {
                    of.echo (child.to_string (false));
                }
            }
            of.state (node != null);
        }
        else of.state (node != null);
    }

    of.rs (done);
    of.echo ();
    return (int) done;

}
