FROM microsoft/dotnet:latest

WORKDIR /app

COPY ./GlaaCore/out . 

ENTRYPOINT ["dotnet", "GlaaCore.Web.dll"]

