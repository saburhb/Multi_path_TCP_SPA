#!/bin/sh

sysctl -w net.mptcp.mptcp_enabled=1
sysctl -w net.mptcp.mptcp_checksum=1
sysctl -w net.mptcp.mptcp_ndiffports=1
sysctl -w net.mptcp.mptcp_debug=1


