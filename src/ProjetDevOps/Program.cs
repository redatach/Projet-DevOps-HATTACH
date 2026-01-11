var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// MODIFIE CETTE LIGNE :
app.MapGet("/", () => "Bonjour et bon courage dans votre projet en DevOps");

app.Run();