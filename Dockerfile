FROM ukhomeofficedigital/centos-base

RUN yum -y install scl-utils libunwind libicu && \
    yum -y install centos-release-dotnet && \
    yum -y install rh-dotnet20

ENV PATH=/opt/rh/rh-dotnet20/root/usr/bin:/opt/rh/rh-dotnet20/root/usr/sbin${PATH:+:${PATH}}
ENV CPATH=/opt/rh/rh-dotnet20/root/usr/include${CPATH:+:${CPATH}}
ENV LD_LIBRARY_PATH=/opt/rh/rh-dotnet20/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
ENV MANPATH=/opt/rh/rh-dotnet20/root/usr/share/man:${MANPATH:-}
ENV PKG_CONFIG_PATH=/opt/rh/rh-dotnet20/root/usr/lib64/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}
ENV XDG_DATA_DIRS=/opt/rh/rh-dotnet20/root/usr/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
ENV DOTNET_CLI_TELEMETRY_OPTOUT=true

RUN ["dotnet", "--version"]

WORKDIR /app

COPY ./GlaaCore/out . 

ENTRYPOINT ["dotnet", "GlaaCore.Web.dll"]

