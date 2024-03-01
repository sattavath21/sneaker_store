using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Product_Collection_CollectionId",
                table: "Product");

            migrationBuilder.DropTable(
                name: "BrandCollection");

            migrationBuilder.DropTable(
                name: "Collection");

            migrationBuilder.RenameColumn(
                name: "CollectionId",
                table: "Product",
                newName: "CollectionId");

            migrationBuilder.RenameIndex(
                name: "IX_Product_CollectionId",
                table: "Product",
                newName: "IX_Product_CollectionId");

            migrationBuilder.CreateTable(
                name: "Collection",
                columns: table => new
                {
                    CollectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CollectionName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Collection", x => x.CollectionId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BrandWithCollection",
                columns: table => new
                {
                    BrandWithCollectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CollectionId = table.Column<int>(type: "int", nullable: false),
                    BrandId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BrandWithCollection", x => x.BrandWithCollectionId);
                    table.ForeignKey(
                        name: "FK_BrandWithCollection_Brand_BrandId",
                        column: x => x.BrandId,
                        principalTable: "Brand",
                        principalColumn: "BrandId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BrandWithCollection_Collection_CollectionId",
                        column: x => x.CollectionId,
                        principalTable: "Collection",
                        principalColumn: "CollectionId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_BrandWithCollection_BrandId",
                table: "BrandWithCollection",
                column: "BrandId");

            migrationBuilder.CreateIndex(
                name: "IX_BrandWithCollection_CollectionId",
                table: "BrandWithCollection",
                column: "CollectionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Product_Collection_CollectionId",
                table: "Product",
                column: "CollectionId",
                principalTable: "Collection",
                principalColumn: "CollectionId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Product_Collection_CollectionId",
                table: "Product");

            migrationBuilder.DropTable(
                name: "BrandWithCollection");

            migrationBuilder.DropTable(
                name: "Collection");

            migrationBuilder.RenameColumn(
                name: "CollectionId",
                table: "Product",
                newName: "CollectionId");

            migrationBuilder.RenameIndex(
                name: "IX_Product_CollectionId",
                table: "Product",
                newName: "IX_Product_CollectionId");

            migrationBuilder.CreateTable(
                name: "Collection",
                columns: table => new
                {
                    CollectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    CollectionName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Collection", x => x.CollectionId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "BrandCollection",
                columns: table => new
                {
                    BrandCollectionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BrandId = table.Column<int>(type: "int", nullable: false),
                    CollectionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BrandCollection", x => x.BrandCollectionId);
                    table.ForeignKey(
                        name: "FK_BrandCollection_Brand_BrandId",
                        column: x => x.BrandId,
                        principalTable: "Brand",
                        principalColumn: "BrandId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BrandCollection_Collection_CollectionId",
                        column: x => x.CollectionId,
                        principalTable: "Collection",
                        principalColumn: "CollectionId",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_BrandCollection_BrandId",
                table: "BrandCollection",
                column: "BrandId");

            migrationBuilder.CreateIndex(
                name: "IX_BrandCollection_CollectionId",
                table: "BrandCollection",
                column: "CollectionId");

            migrationBuilder.AddForeignKey(
                name: "FK_Product_Collection_CollectionId",
                table: "Product",
                column: "CollectionId",
                principalTable: "Collection",
                principalColumn: "CollectionId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
