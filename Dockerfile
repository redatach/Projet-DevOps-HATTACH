# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build

# Copy JUSTE le fichier .csproj d'abord
COPY src/ProjetDevOps/ProjetDevOps.csproj .
RUN dotnet restore

# Copy tout le reste
COPY src/ProjetDevOps/ .
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "ProjetDevOps.dll"]
