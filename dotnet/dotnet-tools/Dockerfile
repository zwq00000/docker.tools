FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

RUN dotnet tool install --tool-path /tools dotnet-trace
RUN dotnet tool install --tool-path /tools dotnet-counters
RUN dotnet tool install --tool-path /tools dotnet-dump

FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /usr/local/sbin
COPY --from=build /tools .

