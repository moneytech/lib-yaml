/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *  @software  : pluie-yaml  <https://git.pluie.org/pluie/lib-yaml>
 *  @version   : 0.5
 *  @type      : library
 *  @date      : 2018
 *  @licence   : GPLv3.0     <http://www.gnu.org/licenses/>
 *  @author    : a-Sansara   <[dev]at[pluie]dot[org]>
 *  @copyright : pluie.org   <http://www.pluie.org/>
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
 *  along with pluie-yaml.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 */

using GLib;
class Pluie.Io.InputChunkStream : Object
{
    protected ulong      chunk_index;
    protected uint8      chunk_size;
    protected uint8      buffer_size;
    protected uint8[]    buffer;
    protected FileStream fs;
  
    public InputChunkStream (string path, uint8 chunk_size)
    {
        this.chunk_size  = chunk_size;
        this.buffer      = new uint8[this.chunk_size];
        this.fs          = FileStream.open (path, "r");
        this.chunk_index = 0;
    }
    public bool eof ()
    {
        bool stop = this.fs.eof ();
        if (stop) {
            this.buffer = null;
        }
        return stop;
    }
    public unowned uint8[] read ()
    {
        if (!this.eof ()) {
            this.buffer_size = (uint8) this.fs.read (this.buffer);
            this.chunk_index++;
        }
        return this.buffer;
    }
    public unowned uint8 get_buffer_size ()
    {
        return this.buffer_size;
    }
    public unowned uint8[] get_buffer ()
    {
        return this.buffer;
    }
    public ulong get_chunk_index ()
    {
        return this.chunk_index-1;
    }
    public uint8 get_chunk_size ()
    {
        return this.chunk_size;
    }
}
