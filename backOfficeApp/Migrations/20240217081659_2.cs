using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Bill_CustomerTransferPic_CustomerTransferPicId",
                table: "Bill");

            migrationBuilder.DropTable(
                name: "CustomerTransferPic");

            migrationBuilder.DropIndex(
                name: "IX_Bill_CustomerTransferPicId",
                table: "Bill");

            migrationBuilder.DropColumn(
                name: "CustomerTransferPicId",
                table: "Bill");

            migrationBuilder.AddColumn<string>(
                name: "CustomerTransferPicPath",
                table: "Bill",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CustomerTransferPicPath",
                table: "Bill");

            migrationBuilder.AddColumn<int>(
                name: "CustomerTransferPicId",
                table: "Bill",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "CustomerTransferPic",
                columns: table => new
                {
                    CustomerTransferPicId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    PicPath = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomerTransferPic", x => x.CustomerTransferPicId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_CustomerTransferPicId",
                table: "Bill",
                column: "CustomerTransferPicId");

            migrationBuilder.AddForeignKey(
                name: "FK_Bill_CustomerTransferPic_CustomerTransferPicId",
                table: "Bill",
                column: "CustomerTransferPicId",
                principalTable: "CustomerTransferPic",
                principalColumn: "CustomerTransferPicId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
