#
# Copyright (c) 2020 Seagate Technology LLC and/or its Affiliates
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# For any questions about this software or licensing,
# please email opensource@seagate.com or cortx-questions@seagate.com.
#

# TODO TEST EOS-8473

{% for node_id, node in pillar['node_specs'].items() %}

{%- if node['user'] == 'root' -%}
  {%- set user_home = '/root' -%}
{%- else -%}
  {%- set user_home= '/opt/seagate/users/' + node['user'] -%}
{% endif %}

check_{{ node_id }}_reachable:
  cmd.run:
    - name: ssh -q -o "ConnectTimeout=5" {{ node['user'] }}@{{ node['host'] }} exit

{% endfor %}
