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

/**
 * interface representing a collection node
 */
public interface Pluie.Yaml.Collection
{
    /**
     * retriew a child node throught specifiyed index
     * @param index index of searched child
     * @return the matching child node
     */
    public abstract Yaml.Node? item (int index);

    /**
     * check if current node contains the specifiyed child node
     * @param child the child to check 
     */
    public abstract bool contains (Yaml.Node child);

    /**
     * count children
     */
    public abstract int count ();

    /**
     * check if empty
     */
    public abstract bool empty ();

    /**
     * get a Yaml.Node Iterator
     */
    public abstract Gee.Iterator<Yaml.Node> iterator ();


    /**
     * retriew the first child
     * @return the first child node
     */
    public abstract Yaml.Node? first ();

    /**
     * retriew the last child
     * @return the last child node
     */
    public abstract Yaml.Node? last ();

    /**
     * retriew the next sibling of specifiyed child node
     * @param child the the reference child node
     */
    public abstract Yaml.Node? child_next_sibling (Yaml.Node child);

    /**
     * retriew the previous sibling of specifiyed child node
     * @param child the the reference child node
     */
    public abstract Yaml.Node? child_previous_sibling (Yaml.Node child);

}
