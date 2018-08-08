/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  @software  : lib-yaml    <https://git.pluie.org/pluie/lib-yaml>
 *  @version   : 0.4
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

/**
 * a test class to implements yamlize

 */
public abstract class Pluie.Yaml.Object : GLib.Object
{
    /**
     *
     */
    public bool yamlize (Yaml.Node node)
    {
        bool done = false;
        try {
            if (node!= null && !node.empty ()) {
                Iterator<Yaml.Node> it = node.iterator ();
                foreach (var child in node) {
                    foreach (var p in this.get_class ().list_properties ()) {
                        if (p.name == child.name) {
                            if (child.tag != null) {
                                switch (child.tag) {
                                    case "int" :
                                        this.set (p.name, int.parse(child.first ().data));
                                        break;
                                }
                            }
                            else {
                                this.set (p.name, child.first ().data);
                            }
                        }
                    }
                }
            }
        }
        catch (GLib.Error e) {
            of.warn (e.message);
            done = false;
        }
        done = true;
        return done;
    }
}
