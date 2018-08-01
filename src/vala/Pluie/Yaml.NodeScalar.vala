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

using Pluie;

/**
 * a class representing a scalar node
 */
public class Pluie.Yaml.NodeScalar : Yaml.BaseNode
{
    /**
     * construct a scalar node
     * @param parent the parent node
     * @param indent the current indentation in node representation string
     * @param data the current scalar data
     */
    public NodeScalar (Yaml.Node? parent = null, int indent = 0, string? data = null)
    {
        base (parent, indent, NODE_TYPE.SCALAR);
        this.data = data;
    }

    /**
     * clone current node
     * @param   the name of clone
     */
    public override Yaml.Node clone_node (string? name = null)
    {
        return new Yaml.NodeScalar (this.parent, this.indent,  this.data);
    }
}
