#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:3.1.23-buster-slim-arm64v8 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

#arm64v8/buildpack-deps:buster-scm
FROM mcr.microsoft.com/dotnet/sdk:3.1.417-buster-arm64v8 AS build
WORKDIR /src
COPY ["HelloBoi2/HelloBoi2.csproj", "HelloBoi2/"]
RUN dotnet restore "HelloBoi2/HelloBoi2.csproj"
COPY . .
WORKDIR "/src/HelloBoi2"
RUN dotnet build "HelloBoi2.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "HelloBoi2.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HelloBoi2.dll"]
